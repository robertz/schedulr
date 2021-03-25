<div v-if="isEditing">
	<div class="card mb-3">
		<div class="card-header bg-primary text-white">
			Task Editor
		</div>
		<div class="card-body">
			<h5 class="card-title">Update a Task</h5>
			<div class="row">
				<div class="col-6">

					<div class="form-group">
						<label for="editorTask">Task</label>
						<input id="editorTask" class="form-control" type="text" v-model="editor.task" />
					</div>
					<div class="form-group">
						<label for="editorURL">URL</label>
						<input id="editorURL" class="form-control" type="text" v-model="editor.url" />
					</div>
					<div class="form-group">
						<label for="editorFile">File</label>
						<input id="editorFile" class="form-control" type="text" v-model="editor.file" />
					</div>

				</div>
				<div class="col-6">
					<div class="form-group">
						<label for="editorStartDate">Start Date</label>
						<input id="editorStartDate" class="form-control" type="text" v-model="editor.startdate" />
					</div>
					<div class="form-group">
						<label for="editorStartTime">Start Time</label>
						<input id="editorStartTime" class="form-control" type="text" v-model="editor.starttime" />
					</div>
					<div class="form-group">
						<label for="editorInterval">Interval</label>
						<input id="editorInterval" class="form-control" type="text" v-model="editor.interval" />
					</div>
				</div>
			</div>
			<div class="col-6">
				<input type="button" class="btn btn-success" value="Update" @click="updateTask" />
				<input type="button" class="btn btn-danger" value="Cancel" @click="isEditing=false" />
			</div>
		</div>
	</div>
</div>

<div class="table-responsive">
	<table class="table table-striped table-bordered table-sm table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Task</th>
				<th scope="col">URL</th>
				<th scope="col">Port</th>
				<th scope="col">File</th>
				<th scope="col">Interval</th>
				<th scope="col">Timeout</th>
				<th scope="col">Start Time</th>
				<th scope="col">Start Date</th>
				<th scope="col">Paused</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="(tsk, idx) in tasks">
				<td>{{ tsk.task }}</td>
				<td>{{ tsk.url }}</td>
				<td>{{ tsk.port }}</td>
				<td>{{ tsk.file }}</td>
				<td>{{ tsk.interval }}</td>
				<td>{{ tsk.timeout }}</td>
				<td>{{ tsk.starttime }}</td>
				<td>{{ tsk.startdate }}</td>
				<td>{{ tsk.paused }}</td>
				<td>
					<i class="fas fa-edit" @click="edit(idx)"></i>
					<i class="fas fa-play" @click="exe(tsk.task)"></i>
					<i class="fas fa-pause" @click="alterTask(idx)" v-bind:class="{ 'text-muted': tsk.paused }"></i>
					<i class="fas fa-times" @click="del(tsk.task)"></i>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="button" class="btn btn-primary" value="Add New" @click="add">
</div>
