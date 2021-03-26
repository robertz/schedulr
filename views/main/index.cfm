<div v-if="isEditing" class="mb-4">
	<div class="card">
		<div class="card-header">
			<p class="card-header-title">Task Editor</p>
		</div>
		<div class="card-content">
			<div class="content">
				<div class="columns">
					<div class="column is-6">


							<label for="editorTask">Task</label>
							<input id="editorTask" class="input" type="text" v-model="editor.task" />

							<label for="editorURL">URL</label>
							<input id="editorURL" class="input" type="text" v-model="editor.url" />

							<label for="editorFile">File</label>
							<input id="editorFile" class="input" type="text" v-model="editor.file" />


					</div>
					<div class="column is-6">

							<label for="editorStartDate">Start Date</label>
							<input id="editorStartDate" class="input" type="text" v-model="editor.startdate" />

							<label for="editorStartTime">Start Time</label>
							<input id="editorStartTime" class="input" type="text" v-model="editor.starttime" />

							<label for="editorInterval">Interval</label>
							<input id="editorInterval" class="input" type="text" v-model="editor.interval" />

					</div>
				</div>
				<div>
					<input type="button" class="button is-success" value="Update" @click="updateTask" />
					<input type="button" class="button is-danger" value="Cancel" @click="isEditing=false" />
				</div>
			</div>

		</div>
	</div>
</div>

<div class="table-container">
	<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
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
	<input type="button" class="button is-primary" value="Add New" @click="add">
</div>
